/*
  Warnings:

  - You are about to drop the column `companyCode` on the `admin` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_admin" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fullName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "phoneNumber" TEXT,
    "role" TEXT NOT NULL,
    "Bio" TEXT
);
INSERT INTO "new_admin" ("Bio", "email", "fullName", "id", "password", "phoneNumber", "role") SELECT "Bio", "email", "fullName", "id", "password", "phoneNumber", "role" FROM "admin";
DROP TABLE "admin";
ALTER TABLE "new_admin" RENAME TO "admin";
CREATE UNIQUE INDEX "admin_email_key" ON "admin"("email");
CREATE UNIQUE INDEX "admin_phoneNumber_key" ON "admin"("phoneNumber");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
