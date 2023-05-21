import joi from "joi";

export const signupSchema = joi.object({
    email: joi.string().min(3).required().email(),
    name: joi.string().min(3).required(),
    password: joi.string().min(6).required(),
    confirmPassword: joi.string().valid(joi.ref('password')).required(),
});