import { DataTypes } from "sequelize";
import { sequelize } from "../database/database.js";

export const Pregunta = sequelize.define("pregunta", {
    pregunta_n: {
      type: DataTypes.STRING
    },
  },
  { timestamps: false }
);