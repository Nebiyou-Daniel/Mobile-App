import { IsEmail, IsNumber, IsOptional, IsString } from "class-validator"

export class EditTraineeDto{
    @IsString()
    @IsOptional()
    fullName: string

    @IsEmail()
    @IsOptional()
    email: string
    
    @IsString()
    @IsOptional()
    phoneNumber: string
    
    @IsString()
    @IsOptional()
    bio: string
    
    @IsNumber()
    @IsOptional()
    trainerId: number
}
