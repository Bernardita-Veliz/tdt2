import express from 'express';
import morgan from 'morgan';
import cors from 'cors';
//import req from "express/lib/request.js";


const app = express();
// CORS
app.use( cors({origin: '*'}) );
//import surveyRoutes from "./routers/survey.routes.js";
//import preguntaRoutes from "./routers/pregunta.routes.js";
import asignaturaRoute from "./routes/asignaturaRoute.js";
//import docenteRoute from "./routes/docenteRoute.js";
import estudianteRoute from "./routes/estudianteRoute.js";
import preguntaRoute from "./routes/preguntaRoute.js";
import respuestaRoute from "./routes/respuestaRoute.js";
//import tipoRoute from "./routes/tipoRoute.js";


//middleewares
app.use(morgan("dev"));
app.use(express.json({limit: '50mb'}));

app.use("/api/asignatura", asignaturaRoute);
//app.use("/api/docente", docenteRoute);
app.use("/api/estudiante", estudianteRoute);
app.use("/api/pregunta", preguntaRoute);
app.use("/api/respuesta", respuestaRoute);
//app.use("/api/tipo", tipoRoute);

//Routes
//app.use("/api/survey", surveyRoutes);
//app.use("/api/pregunta", preguntaRoutes);

export default app;