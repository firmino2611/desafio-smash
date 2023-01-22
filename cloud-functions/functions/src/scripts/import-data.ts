import * as admin from "firebase-admin";
import * as functions from "firebase-functions";
import json from "./../data/cities.json";
interface LineData {
  city: string;
  country: string;
  subCountry: string;
  geoId: string;
}

export const importData = functions
  .runWith({ timeoutSeconds: 540 })
  .https.onRequest(
    async (
      request: functions.https.Request,
      response: functions.Response
    ): Promise<any> => {
      const db: admin.firestore.Firestore = admin.firestore();

      let countries: Array<admin.firestore.DocumentSnapshot> = [];
      try {
        for (let index = 0; index < json.length; index++) {
          const city = json[index];

          const lineData: LineData = {
            city: city.name,
            country: city.country,
            subCountry: city.subcountry,
            geoId: city.geonameid.toString(),
          };

          let countrySaved;

          const countryData = { name: lineData.country };
          const countryExists = countries.find((c) => {
            return c.data()!.name == lineData.country;
          });

          if (!countryExists) {
            countrySaved = await (
              await db.collection("countries").add({ ...countryData })
            ).get();

            countries.push(countrySaved);
          }

          await db
            .collection("cities")
            .doc(lineData.geoId)
            .set({
              name: lineData.city,
              country: countryExists?.ref ?? countrySaved?.ref,
              subCountry: lineData.subCountry,
            });
        }

        return response.status(200).json({
          message: "Import success!",
        });
      } catch (error) {
        return response.status(500).json({
          error: error,
          message: "there was a problem",
        });
      }
    }
  );
