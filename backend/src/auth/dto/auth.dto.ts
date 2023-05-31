import { IsEmail, IsEmpty, IsInt, IsNotEmpty, IsOptional, IsString } from "class-validator"

export class signupDto{
    @IsNotEmpty()
    @IsString()
    fullName: string
    @IsNotEmpty()
    @IsString()
    @IsEmail()
    email: string
    @IsNotEmpty()
    @IsString()
    role: string
    @IsNotEmpty()
    @IsString()
    password: string
}

export class loginDto{
    @IsNotEmpty()
    @IsString()
    @IsEmail()
    email: string
    @IsNotEmpty()
    @IsString()
    role: string
    @IsNotEmpty()
    @IsString()
    password: string
}


