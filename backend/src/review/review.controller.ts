import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post, UseGuards } from '@nestjs/common';
import { JwtGuard } from 'src/auth/guard';
import { ReviewService } from './review.service';
import { GetTrainee, GetTrainer } from 'src/auth/decorator';
import { CreateReviewDto, EditReviewDto } from './dto';

@UseGuards(JwtGuard)
@Controller('review')
export class ReviewController {
    constructor(private reviewService: ReviewService){}
    @Post()
    createReview(
        @GetTrainee('id') traineeId: number, 
        @Body() dto: CreateReviewDto
    ){
        return this.reviewService.createReview(traineeId, dto);
    }
    
    @Get()
    getAllReviews(
        @GetTrainer('id') trainerId: number
    ){
        return this.reviewService.getAllReviewsOfTrainer(trainerId);
    }

    @Get(':id')
    getReviewById(
        @GetTrainee('id') traineeId: number,
        @Param('id', ParseIntPipe) reviewId: number
    ){
        return this.reviewService.getReviewById(traineeId, reviewId);
    }

    @Patch(':id')
    editReviewById(
        @GetTrainee('id') traineeId: number,
        @Param('id', ParseIntPipe) reviewId: number,
        @Body() dto: EditReviewDto
    ){
        return this.reviewService.editReviewById(traineeId, reviewId, dto);
    }

    @Delete(':id')
    deleteReviewById(
        @GetTrainee('id') traineeId: number,
        @Param('id', ParseIntPipe) reviewId: number
    ){
        return this.reviewService.deleteReviewById(traineeId, reviewId);
    }

}
