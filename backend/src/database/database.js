import Sequelize from "sequelize";

export const sequelize = new Sequelize('TDT', 'postgres', 'admin', {
    host: "34.176.172.130",
    dialect: "postgres",

});