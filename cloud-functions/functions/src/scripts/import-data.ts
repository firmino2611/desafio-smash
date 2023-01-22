import * as admin from "firebase-admin";
import * as functions from "firebase-functions";

interface LineData {
  city: string;
  country: string;
  subCountry: string;
  geoId: string;
}

// const filePath = "functions/word-cities.csv";

export const importData = functions
  .runWith({ timeoutSeconds: 540 })
  .https.onRequest(
    async (
      req: functions.https.Request,
      response: functions.Response
    ): Promise<any> => {
      const db: admin.firestore.Firestore = admin.firestore();

      let countries: Array<admin.firestore.DocumentSnapshot> = [];

      for (let index = 0; index < lines.length; index++) {
        const line = lines[index];

        const fields = line.split(",");
        const lineData: LineData = {
          city: fields[0],
          country: fields[1],
          subCountry: fields[2],
          geoId: fields[3],
        };

        let countrySaved;

        if (index > 0) {
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
      }

      return response.json(lines.length);
    }
  );
