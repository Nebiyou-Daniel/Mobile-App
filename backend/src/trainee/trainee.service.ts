import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { EditTraineeDto } from './dto';

@Injectable()
export class TraineeService {
    constructor(private prisma: PrismaService){}

    async editTrainee(traineeId: number, dto: EditTraineeDto){
        const trainee = await this.prisma.trainee.update({
            where: {
                id: traineeId,
            },
            data: {
                ...dto,
            }
        });
        delete trainee.password;

        return trainee;
    }
}
