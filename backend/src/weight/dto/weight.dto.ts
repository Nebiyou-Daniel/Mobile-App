import { IsNotEmpty, IsNumber, IsOptional, IsString } from "class-validator"

export class CreateWeightDto{
    
    @IsString()
    @IsNotEmpty()
    weight: string
    
    @IsString()
    @IsOptional()
    height: string

    @IsNumber()
    @IsOptional()
    traineeId?: number

    @IsNumber()
    @IsOptional()
    trainerId?: number
}

export class EditWeightDto{
    
    @IsString()
    @IsOptional()
    weight?: string
    
    @IsString()
    @IsOptional()
    height?: string
}
