import {Respuesta} from '../models/respuestas.js';

// Obtener todas las respuestas

export const getRespuestas = async (req, res) => {
  try{
      const respuestas = await Respuesta.findAll();
      res.json(respuestas);

  } catch(error){
      return res.status(500).json({ message: error.message});
  }
};
// Obtener una respuesta por ID
export const getRespuesta = async (req, res) => {
    try{
        const {id} = req.params;
        const respuesta = await Respuesta.findOne({
            where: {
                id,
            }
        });
        if (!respuesta)
            return res.status(404).json({ message: "No se encontró la respuesta." });

    } catch(error){
        return res.status(500).json({ message: error.message});
    }
};

// Crear una nueva respuesta
export const createRespuesta = async (req, res) => {
  const {respuesta_n} = req.body;

  try {
      const newRespuesta = await Respuesta.create({

        respuesta_n
      });
      res.json('newRespuesta')
      
  } catch (error) {
      return res.status(500).json({ error});
  }

};

// Actualizar una respuesta por ID

export const updateRespuesta = async (req, res) => {
  try {
      const {id} = req.params;
      const {respuesta_n} = req.body;
  
      const respuesta = await Respuesta.findByPk(id);

      respuesta.respuesta_n = respuesta_n;
      await respuesta.save();
      if(!respuesta){
        return res.status(404).json({ mensaje: 'No se encontró la respuesta.' });
      }

      res.json(respuesta);
      
  } catch (error) {
      return res.status(500).json({message: error.message});
      
  }
};

// Eliminar una respuesta por ID
export const deleteRespuesta = async (req, res) => {
  try {
      const {id} = req.params;
      if (!id) {
        return res.status(404).json({ mensaje: 'No se encontró la respuesta.' });
      }
      await Respuesta.destroy({
          where: {
              id,
          },
      });
      res.sendStatus('204')
      
  } catch (error) {
      return res.status(500).json({ message: error.message});
      
  }
};
