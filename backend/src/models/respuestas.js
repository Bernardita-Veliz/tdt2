import { DataTypes } from "sequelize";
import { sequelize } from "../database/database.js";

export const Respuesta = sequelize.define("respuesta", {
  respuesta_n: {
    type: DataTypes.STRING
  }
},
{ timestamps: false }
);
