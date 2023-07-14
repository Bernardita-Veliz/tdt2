import Sequelize from "sequelize";

export const sequelize = new Sequelize('TDT', 'postgres', 'admin', {
    host: "34.176.72.245",
    dialect: "postgres",

});