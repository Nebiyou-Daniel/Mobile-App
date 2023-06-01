import { IsNotEmpty, IsNumber, IsOptional, IsString } from "class-validator"

export class CreateReviewDto{
    
    @IsString()
    comment: string
    @IsNumber()
    rating: number
    @IsNumber()
    @IsNotEmpty()
    trainerId: number
}

export class EditReviewDto{
    
    @IsString()
    @IsOptional()
    comment?: string
    @IsNumber()
    @IsOptional()
    rating?: number
}
