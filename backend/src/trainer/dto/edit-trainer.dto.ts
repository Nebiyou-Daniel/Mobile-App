import { IsEmail, IsOptional, IsString } from "class-validator"

export class EditTrainerDto{
    @IsString()
    @IsOptional()
    fullName?: string

    @IsEmail()
    @IsOptional()
    email?: string
    
    @IsString()
    @IsOptional()
    phoneNumber?: string
    
    @IsString()
    @IsOptional()
    bio?: string

}
