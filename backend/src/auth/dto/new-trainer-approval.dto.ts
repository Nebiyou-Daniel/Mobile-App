import { IsNotEmpty, IsNumber, IsString } from "class-validator"

export class NewTrainerApprovalDto{
    @IsNotEmpty()
    @IsString()    
    previousJobXp: string
    @IsNotEmpty()
    @IsNumber()
    yearsOfXp: number
    @IsNotEmpty()
    @IsString()
    previousWorkPlace: string
}
