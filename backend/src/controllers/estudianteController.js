import { Estudiante } from '../models/estudiantes.js';

// Controlador para obtener todos los estudiantes
export const getEstudiantes = async (req, res) => {
  try{
      const estudiantes = await Estudiante.findAll();
      res.json(estudiantes);

  } catch(error){
      return res.status(500).json({ message: error.message});
  }
};

// Controlador para crear un nuevo estudiante
export const createEstudiante = async (req, res) => {
  const {nombre, apellido, email, password} = req.body;

  try {
      const newEstudiante = await Estudiante.create({
        nombre,
        apellido,
        email,
        password
      });
      res.json('newEstudiante')
      
  } catch (error) {
      return res.status(500).json({ message: error.message});
  }

};

// Controlador para obtener un estudiante por su id
export const getEstudiante = async (req, res) => {
  try{
      const {id} = req.params;
      const estudiante = await Estudiante.findOne({
          where: {
              id,
          }
      });
      if (!estudiante)
          return res.status(404).json({ message: "Estudiante no encontrado" });

  } catch(error){
      return res.status(500).json({ message: error.message});
  }
};

// Controlador para actualizar un estudiante por su id
export const updateEstudiante = async (req, res) => {
  try {
      const {id} = req.params;
      const {nombre, apellido, email, password} = req.body;
  
      const estudiante = await Estudiante.findByPk(id);
      estudiante.nombre = nombre;
      estudiante.apellido = apellido;
      estudiante.email = email;
      estudiante.password = password;
      await estudiante.save();

      res.json(estudiante);
      
  } catch (error) {
      return res.status(500).json({message: error.message});
      
  }
};

// Controlador para eliminar un estudiante por su id
export const deleteEstudiante = async (req, res) => {
  try {
      const {id} = req.params;
      await Estudiante.destroy({
          where: {
              id,
          },
      });
      res.sendStatus('204')
      
  } catch (error) {
      return res.status(500).json({ message: error.message});
      
  }
};
