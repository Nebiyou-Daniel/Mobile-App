/*
  Warnings:

  - Added the required column `dateAssigned` to the `tasks` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_tasks" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "taskName" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "dateAssigned" TEXT NOT NULL,
    "taskDone" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "traineeId" INTEGER NOT NULL,
    "trainerId" INTEGER NOT NULL,
    CONSTRAINT "tasks_traineeId_fkey" FOREIGN KEY ("traineeId") REFERENCES "trainee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "tasks_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "trainer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_tasks" ("createdAt", "description", "id", "taskDone", "taskName", "traineeId", "trainerId", "updatedAt") SELECT "createdAt", "description", "id", "taskDone", "taskName", "traineeId", "trainerId", "updatedAt" FROM "tasks";
DROP TABLE "tasks";
ALTER TABLE "new_tasks" RENAME TO "tasks";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
