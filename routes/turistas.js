var express = require('express');
var router = express.Router();

var dbConn = require('../database');

router.get('/',function(req, res, next) {    
    const sessionData = req.session;
   console.log("sessionData:",sessionData );
   if(sessionData.user_id ==1){
    dbConn.query('SELECT * FROM agencia_viajes.turista ORDER BY id desc',function(err,rows)     {
        if(err) {
            req.flash('error', err);
            // render to views/turistas/index.ejs
            res.render('turistas',{data:''});   
        } else {
            // render en  views/turistas/index.ejs
            res.render('turistas',{data:rows});
        }
    
    });
  } else{
   
   
    console.log("Debes Logearte");
    res.render('index', { title: 'Debes Logearte', session : req.session });
  }
   
});



// display add turista page
router.get('/add', function(req, res, next) {    
   
   
    // renderiza add.ejs envia las variables vacias para que se completen en el form post
    res.render('turistas/add', {
        nombre: '',
        apellidos: '',
        direccion:''
    })
})

// aagregar a un nuevo turista
router.post('/add',function(req, res, next) {    
    
    let nombre = req.body.nombre;
    let apellidos = req.body.apellidos;
    let direccion= req.body.direccion;
    let errors = false;

    if(nombre.length === 0 || apellidos.length === 0 || direccion=== 0) {
        errors = true;

        // set flash message
        req.flash('error', "Ingrese nombre apellidos direccion  ");
        // render con  add.ejs 
        res.render('turistas/add', {
            nombre: nombre,
            apellidos: apellidos,
            direccion:direccion
        })
    }

    // if no error
    if(!errors) {

        var form_data = {
            nombre: nombre,
            apellidos: apellidos,
            direccion:direccion
        }
        
        // insert query
        dbConn.query('INSERT INTO turista SET ?', form_data, function(err, result) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                 
                // render to add.ejs
                res.render('turistas/add', {
                    nombre: form_data.nombre,
                    apellidos: form_data.apellidos,
                    direccion:form_data.direccion
                })
            } else {                
                req.flash('success', 'turista agregado');
                res.redirect('/turistas');
            }
        })
    }
})

// muestra pagina de edicion 
router.get('/edit/(:id)', function(req, res, next) {
   
    let id = req.params.id;
   
    dbConn.query('SELECT * FROM turista WHERE id = ' + id, function(err, rows, fields) {
        if(err) throw err
         
        // if turista not found
        if (rows.length <= 0) {
            req.flash('error', 'turista  encontrado  id = ' + id)
            res.redirect('/turistas')
        }
        // if turista found
        else {
            // render edit.ejs
            res.render('turistas/edit', {
                title: 'Edit turista', 
                id: rows[0].id,
                nombre: rows[0].nombre,
                apellidos: rows[0].apellidos,
                direccion: rows[0].direccion
            })
        }
    })
})

// update turista data
router.post('/update/:id', function(req, res, next) {
   
    let id = req.params.id;
    let nombre = req.body.nombre;
    let apellidos = req.body.apellidos;
    let direccion= req.body.direccion;
    let errors = false;

    if(nombre.length === 0 || apellidos.length === 0 || direccion.length === 0) {
        errors = true;
        
        // set flash message
        req.flash('error', "Ingrese nombre apellidos  direccion");
        // render  add.ejs  con  flash message
        res.render('turistas/edit', {
            id: req.params.id,
            nombre: nombre,
            apellidos: apellidos,
            direccion:direccion
        })
    }

    // if no error
    if( !errors ) {   
 
        var form_data = {
            nombre: nombre,
            apellidos: apellidos,
            direccion:direccion
        }
        // update query
        dbConn.query('UPDATE turista SET ? WHERE id = ' + id, form_data, function(err, result) {
            //if(err) throw err
            if (err) {
                // seteamos a  flash message
                req.flash('error', err)
                // render edit.ejs
                res.render('turistas/edit', {
                    id: req.params.id,
                    nombre: form_data.nombre,
                    apellidos: form_data.apellidos,
                    direccion: form_data.direccion
                })
            } else {
                req.flash('success', 'turista ACTUALIZADO');
                res.redirect('/turistas');
            }
        })
    }
})
   
// delete turista
router.get('/delete/(:id)', function(req, res, next) {
    

  var id = req.params.id;
  console.log("id:",id)
     console.log("JSON.stringify(id)", JSON.stringify(id))
    dbConn.query(`
	DELETE FROM turista WHERE id = "${id}"
	`, function(err, result) {
        //if(err) throw err
        if (err) {
            console.log("JSON.stringify(id)", JSON.stringify(id))
            // set flash message
         req.flash('error','Debera anular antes la Reserva')
            // redirect to turista page
            res.redirect('/turistas')
        } else {
            // set flash message
            req.flash('success', 'Sample Data Deleted');
            // redirect to turista page
            res.redirect('/turistas')
        }
    })
})


module.exports = router;
