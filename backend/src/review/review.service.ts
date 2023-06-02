import { ForbiddenException, Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateReviewDto, EditReviewDto } from './dto';

@Injectable()
export class ReviewService {
    
    constructor(private prisma: PrismaService){}

    async getTraineeReview(traineeId: number, trainerId: number) {
        const review = await this.prisma.review.findFirst({
            where: {
                traineeId: traineeId,
                trainerId: trainerId
            }
        })
        if (!review){
            throw new ForbiddenException('No Review.')
        }
        return review
    }

    async createReview(traineeId: number, dto: CreateReviewDto){
        const review = await this.prisma.review.create({
            data: {
                traineeId,
                ...dto
            }
        })
        return review;
    }

    getAllReviewsOfTrainer(trainerId: number){
        return this.prisma.review.findMany({
            where: {
                trainerId
            }
        })
    }

    getReviewById(traineeId: number, reviewId: number){
        return this.prisma.review.findFirst({
            where: {
                id: reviewId,
                traineeId
            }
        })        
    }

    async editReviewById(traineeId: number, reviewId: number, dto: EditReviewDto){
        const review = await this.prisma.review.findUnique({
            where: {
                id: reviewId
            }

        })
        if (!review || review.traineeId !== traineeId){
            throw new ForbiddenException('Access to resource denied')
        }

        return this.prisma.review.update({
            where: {
                id: reviewId
            },
            data: {
                ...dto
            }
        })
    }

    async deleteReviewById(traineeId: number, reviewId: number){
        const review = await this.prisma.review.findUnique({
            where: {
                id: reviewId
            }

        })
        if (!review || review.traineeId !== traineeId){
            throw new ForbiddenException('Access to resource denied')
        }
        await this.prisma.review.delete({
            where: {
                id: reviewId
            }
        })
    }
}
