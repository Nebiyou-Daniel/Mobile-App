import { IsNotEmpty, IsNumber } from "class-validator";

export class NewTrainerDto{
    @IsNumber()
    @IsNotEmpty()
    trainerId: number
}
