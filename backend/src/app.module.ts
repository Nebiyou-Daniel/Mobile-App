import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { TraineeModule } from './trainee/trainee.module';
import { TrainerModule } from './trainer/trainer.module';
import { AdminModule } from './admin/admin.module';
import { TaskModule } from './task/task.module';
import { ReviewModule } from './review/review.module';
import { NotificationModule } from './notification/notification.module';
import { WeightModule } from './weight/weight.module';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [AuthModule, TraineeModule, TrainerModule, AdminModule, TaskModule, ReviewModule, NotificationModule, WeightModule, PrismaModule],
})
export class AppModule {}
