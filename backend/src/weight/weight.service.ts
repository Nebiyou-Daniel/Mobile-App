import { ForbiddenException, Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateWeightDto, EditWeightDto } from './dto';

@Injectable()
export class WeightService {
    constructor(private prisma: PrismaService){}

    async addWeightForTrainee(traineeId: number, dto: CreateWeightDto){
        const weight = await this.prisma.weight.create({
            data: {
                traineeId,
                ...dto
            }
        })
        return weight;
    }


    async addWeightForTrainer(trainerId: number, dto: CreateWeightDto){
        const weight = await this.prisma.weight.create({
            data: {
                trainerId,
                ...dto
            }
        })
        return weight;
    }


    async getAllWeightsForTrainee(traineeId: number){
        return this.prisma.weight.findMany({
            where: {
                traineeId
            }
        })
    }


    async getAllWeightsForTrainer(trainerId: number){
        return this.prisma.weight.findMany({
            where: {
                trainerId
            }
        })
    }

    async updateWeightById(weightId: number, dto: EditWeightDto){
        const weight = await this.prisma.weight.findUnique({
            where: {
                id: weightId
            }

        })
        if (!weight){
            throw new ForbiddenException('Access to resource denied')
        }

        return this.prisma.weight.update({
            where: {
                id: weightId
            },
            data: {
                ...dto
            }
        })
    }

    async deleteWeightById(weightId: number){
        const weight = await this.prisma.weight.findUnique({
            where: {
                id: weightId
            }

        })
        if (!weight){
            throw new ForbiddenException('Access to resource denied')
        }
        await this.prisma.weight.delete({
            where: {
                id: weightId
            }
        })
    }
}
