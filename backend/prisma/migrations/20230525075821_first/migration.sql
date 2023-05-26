-- CreateTable
CREATE TABLE "trainee" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fullName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "phoneNumber" TEXT,
    "role" TEXT NOT NULL,
    "Bio" TEXT,
    "trainerId" INTEGER NOT NULL,
    CONSTRAINT "trainee_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "trainer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "trainer" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fullName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "phoneNumber" TEXT,
    "role" TEXT NOT NULL,
    "Bio" TEXT,
    "averageRating" INTEGER NOT NULL DEFAULT 0,
    "previousJobXp" TEXT,
    "yearsOfXp" INTEGER,
    "previousWorkPlace" TEXT
);

-- CreateTable
CREATE TABLE "admin" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fullName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "phoneNumber" TEXT,
    "role" TEXT NOT NULL,
    "Bio" TEXT
);

-- CreateTable
CREATE TABLE "tasks" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "taskName" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "traineeId" INTEGER NOT NULL,
    "trainerId" INTEGER NOT NULL,
    CONSTRAINT "tasks_traineeId_fkey" FOREIGN KEY ("traineeId") REFERENCES "trainee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "tasks_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "trainer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Review" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "comment" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "traineeId" INTEGER NOT NULL,
    "trainerId" INTEGER NOT NULL,
    CONSTRAINT "Review_traineeId_fkey" FOREIGN KEY ("traineeId") REFERENCES "trainee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Review_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "trainer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Notification" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "traineeId" INTEGER NOT NULL,
    "trainerId" INTEGER NOT NULL,
    "adminId" INTEGER NOT NULL,
    CONSTRAINT "Notification_traineeId_fkey" FOREIGN KEY ("traineeId") REFERENCES "trainee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Notification_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "trainer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Notification_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "admin" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Weight" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "weight" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "traineeId" INTEGER NOT NULL,
    "trainerId" INTEGER NOT NULL,
    CONSTRAINT "Weight_traineeId_fkey" FOREIGN KEY ("traineeId") REFERENCES "trainee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Weight_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "trainer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "trainee_email_key" ON "trainee"("email");

-- CreateIndex
CREATE UNIQUE INDEX "trainee_phoneNumber_key" ON "trainee"("phoneNumber");

-- CreateIndex
CREATE UNIQUE INDEX "trainer_email_key" ON "trainer"("email");

-- CreateIndex
CREATE UNIQUE INDEX "trainer_phoneNumber_key" ON "trainer"("phoneNumber");

-- CreateIndex
CREATE UNIQUE INDEX "admin_email_key" ON "admin"("email");

-- CreateIndex
CREATE UNIQUE INDEX "admin_phoneNumber_key" ON "admin"("phoneNumber");
