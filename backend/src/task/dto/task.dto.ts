import { IsBoolean, IsNotEmpty, IsNumber, IsOptional, IsString } from "class-validator"

export class CreateTaskDto{
    
    @IsNotEmpty()
    @IsString()
    taskName: string

    @IsNotEmpty()
    @IsString()
    description: string

    @IsNotEmpty()
    @IsString()
    assignedDate: string

    @IsNotEmpty()
    @IsNumber()
    traineeId: number
}

export class EditTaskDto{
    
    @IsOptional()
    @IsString()
    taskName?: string

    @IsOptional()
    @IsString()
    description?: string

    @IsOptional()
    @IsBoolean()
    taskDone?: boolean
}
