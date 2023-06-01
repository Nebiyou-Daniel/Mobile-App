-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_admin" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fullName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "phoneNumber" TEXT,
    "role" TEXT NOT NULL DEFAULT 'admin',
    "bio" TEXT
);
INSERT INTO "new_admin" ("bio", "email", "fullName", "id", "password", "phoneNumber", "role") SELECT "bio", "email", "fullName", "id", "password", "phoneNumber", "role" FROM "admin";
DROP TABLE "admin";
ALTER TABLE "new_admin" RENAME TO "admin";
CREATE UNIQUE INDEX "admin_email_key" ON "admin"("email");
CREATE UNIQUE INDEX "admin_phoneNumber_key" ON "admin"("phoneNumber");
CREATE TABLE "new_trainee" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fullName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "phoneNumber" TEXT,
    "role" TEXT NOT NULL DEFAULT 'trainee',
    "bio" TEXT,
    "trainerId" INTEGER,
    "previousJobXp" TEXT,
    "yearsOfXp" INTEGER,
    "previousWorkPlace" TEXT,
    CONSTRAINT "trainee_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "trainer" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_trainee" ("bio", "email", "fullName", "id", "password", "phoneNumber", "previousJobXp", "previousWorkPlace", "role", "trainerId", "yearsOfXp") SELECT "bio", "email", "fullName", "id", "password", "phoneNumber", "previousJobXp", "previousWorkPlace", "role", "trainerId", "yearsOfXp" FROM "trainee";
DROP TABLE "trainee";
ALTER TABLE "new_trainee" RENAME TO "trainee";
CREATE UNIQUE INDEX "trainee_email_key" ON "trainee"("email");
CREATE UNIQUE INDEX "trainee_phoneNumber_key" ON "trainee"("phoneNumber");
CREATE TABLE "new_trainer" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fullName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "phoneNumber" TEXT,
    "role" TEXT NOT NULL DEFAULT 'trainer',
    "bio" TEXT,
    "averageRating" INTEGER NOT NULL DEFAULT 0,
    "previousJobXp" TEXT,
    "yearsOfXp" INTEGER,
    "previousWorkPlace" TEXT
);
INSERT INTO "new_trainer" ("averageRating", "bio", "email", "fullName", "id", "password", "phoneNumber", "previousJobXp", "previousWorkPlace", "role", "yearsOfXp") SELECT "averageRating", "bio", "email", "fullName", "id", "password", "phoneNumber", "previousJobXp", "previousWorkPlace", "role", "yearsOfXp" FROM "trainer";
DROP TABLE "trainer";
ALTER TABLE "new_trainer" RENAME TO "trainer";
CREATE UNIQUE INDEX "trainer_email_key" ON "trainer"("email");
CREATE UNIQUE INDEX "trainer_phoneNumber_key" ON "trainer"("phoneNumber");
CREATE TABLE "new_Notification" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "markAsRead" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "traineeId" INTEGER,
    "trainerId" INTEGER,
    "adminId" INTEGER,
    CONSTRAINT "Notification_traineeId_fkey" FOREIGN KEY ("traineeId") REFERENCES "trainee" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Notification_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "trainer" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Notification_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "admin" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Notification" ("adminId", "createdAt", "details", "id", "title", "traineeId", "trainerId") SELECT "adminId", "createdAt", "details", "id", "title", "traineeId", "trainerId" FROM "Notification";
DROP TABLE "Notification";
ALTER TABLE "new_Notification" RENAME TO "Notification";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
