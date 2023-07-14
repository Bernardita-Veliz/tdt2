import { Asignatura } from '../models/asignaturas.js';

// Obtener todos los docentes
export const getAsignaturas = async (req, res) => {
  try{
      const asignaturas = await Asignatura.findAll();
      res.json(asignaturas);

  } catch(error){
      return res.status(500).json({ message: error.message});
  }
};

// Crear un nuevo docente
export const createAsignatura = async (req, res) => {

    console.log(req)
    const {nombre} = req.body;

    try {
        const newAsignatura = await Asignatura.create({
            nombre
        });
        res.json('newAsignatura')
        
    } catch (error) {
        return res.status(500).json({ error});
    }

};

// Obtener un docente por su id

export const getAsignatura = async (req, res) => {
  try{
      const {id} = req.params;
      const asignatura = await Asignatura.findOne({
          where: {
              id,
          }
      });
      if (!asignatura)
          return res.status(404).json({ message: "No se encontró el docente." });

  } catch(error){
      return res.status(500).json({ message: error.message});
  }
};

// Actualizar un docente por su id
export const updateAsignatura = async (req, res) => {
  try {
      const {id} = req.params;
      const {nombre} = req.body;
  
      const asignatura = await Asignatura.findByPk(id);
      asignatura.nombre = nombre;
      await asignatura.save();

      res.json(asignatura);
      
  } catch (error) {
      return res.status(500).json({message: error.message});
      
  }
};

// Eliminar una asignatura por su id
export const deleteAsignatura = async (req, res) => {
  try {
      const {id} = req.params;
      await Asignatura.destroy({
          where: {
              id,
          },
      });
      res.sendStatus('204')
      
  } catch (error) {
      return res.status(500).json('error');
      
  }
};
