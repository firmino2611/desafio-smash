import * as admin from "firebase-admin";
import { importData } from "./scripts/import-data";

admin.initializeApp();

exports.import = importData;
