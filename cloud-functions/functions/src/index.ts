import * as admin from "firebase-admin";
import { importData } from "./scripts/import-data";

// // Start writing functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

admin.initializeApp({
  storageBucket: "desafio-smash.appspot.com",
});

exports.import = importData;
