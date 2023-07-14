import { DataTypes } from "sequelize";
import { sequelize } from "../database/database.js";

export const Estudiante = sequelize.define("estudiante", {
  
  nombre: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  apellido: {
    type: DataTypes.STRING,
    allowNull: false
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false
  }
  
},
{ timestamps: false }
);
