import { DataTypes } from "sequelize";
import { sequelize } from "../database/database.js";

export const Asignatura = sequelize.define("asignatura", {
    nombre: {
      type: DataTypes.STRING
      
    },
  },
  { timestamps: false }
);

  