-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_trainee" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fullName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "phoneNumber" TEXT,
    "role" TEXT NOT NULL,
    "Bio" TEXT,
    "trainerId" INTEGER,
    CONSTRAINT "trainee_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "trainer" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_trainee" ("Bio", "email", "fullName", "id", "password", "phoneNumber", "role", "trainerId") SELECT "Bio", "email", "fullName", "id", "password", "phoneNumber", "role", "trainerId" FROM "trainee";
DROP TABLE "trainee";
ALTER TABLE "new_trainee" RENAME TO "trainee";
CREATE UNIQUE INDEX "trainee_email_key" ON "trainee"("email");
CREATE UNIQUE INDEX "trainee_phoneNumber_key" ON "trainee"("phoneNumber");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
