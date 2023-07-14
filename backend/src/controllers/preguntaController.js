import {Pregunta} from '../models/preguntas.js';


export const getPreguntas = async (req, res) => {
  try{
      const preguntas = await Pregunta.findAll();
      res.json(preguntas);

  } catch(error){
      return res.status(500).json({ message: error.message});
  }
};


export const getPregunta = async (req, res) => {
  try{
      const {id} = req.params;
      const pregunta = await Pregunta.findOne({
          where: {
              id,
          }
      });
      if (!pregunta)
          return res.status(404).json({ message: "Project doe not exists" });

  } catch(error){
      return res.status(500).json({ message: error.message});
  }
};

export const createPregunta = async (req, res) => {
  console.log(req)
  const {pregunta_n} = req.body;
  try {
      const newPregunta = await Pregunta.create({
        pregunta_n
      });
      res.json('newPregunta')
      
  } catch (error) {
      return res.status(500).json(error);
  }

};

export const updatePregunta = async (req, res) => {
  try {
      const {id} = req.params;
      const {pregunta_n} = req.body;
  
      const pregunta = await Pregunta.findByPk(id);
      pregunta.pregunta_n = pregunta_n;
      await pregunta.save();

      res.json(pregunta);
      
  } catch (error) {
      return res.status(500).json({error});
      
  }
};

export const deletePregunta = async (req, res) => {
  try {
      const {id} = req.params;
      await Pregunta.destroy({
          where: {
              id,
          },
      });
      res.sendStatus('204')
      
  } catch (error) {
      return res.status(500).json({ error});
      
  }
};

