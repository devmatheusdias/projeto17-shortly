import joi from "joi";

export const signinSchema = joi.object({
    email: joi.string().min(3).required().email(),
    password: joi.string().min(6).required(),
});