<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SucursalController extends Controller
{
    public function index()
    {
        $sql = DB::select(" SELECT
        sucursal.*,
        provincias.idProv,
        departamentos.idDepa,
        distritos.Distrito as nomDistrito,
        provincias.Provincia,
        departamentos.Departamento
        FROM
        sucursal
        INNER JOIN distritos ON sucursal.distrito = distritos.idDist
        INNER JOIN provincias ON distritos.idProv = provincias.idProv
        INNER JOIN departamentos ON provincias.idDepa = departamentos.idDepa
        
         ");
        $departamento = DB::select(" select * from departamentos ");

        $provincia = DB::select(" select * from provincias ");
        $distrito = DB::select(" select * from distritos ");

        return view("vistas/sucursal/sucursal", compact("sql", "departamento", "provincia", "distrito"));
    }

   public function store(Request $request)
{
    // Validar los datos del formulario
    $request->validate([
        "nombre" => "required|string|max:255|unique:sucursal,nombre",
        "distrito" => "required",
        "direccion" => "required|string|max:255",
        "telefono" => "required|numeric",
    ]);
    
    //$nombre = $request->txtnombre;

    //$verificarDuplicado = DB::select("select count(*) as 'total' from sucursal where nombre='$nombre'");
    //if ($verificarDuplicado[0]->total >= 1) {
    //    return back()->with("INCORRECTO", "La sucursal ya existe");
    //}
    try {
        // Insertar los datos en la base de datos
        $insertar = DB::insert("insert into sucursal(distrito,nombre,direccion,telefono) values(?,?,?,?)", [
            $request->distrito, $request->nombre, $request->direccion, $request->telefono,
        ]);
    } catch (\Throwable $th) {
        return back()->with('INCORRECTO', 'Error al registrar la sucursal');
    }

    if ($insertar == 1) {
        return back()->with("CORRECTO", "Sucursal registrada correctamente");
    } else {
        return back()->with("INCORRECTO", "Error al registrar la sucursal");
    }
}


    public function update(Request $request, $id)
    {
        $request->validate([
            "nombre" => "required",
            "distrito" => "required",
            "direccion" => "required",
            "telefono" => "required",
        ]);
        try {
            $actualizar = DB::update("update sucursal set distrito=?, nombre=?, direccion=?, telefono=? where id_sucursal=?  ", [
                $request->distrito, $request->nombre,
                $request->direccion, $request->telefono, $id
            ]);
            if ($actualizar == 0) {
                $actualizar = 1;
            }
        } catch (\Throwable $th) {
            //throw $th;
        }

        if ($actualizar == 1) {
            return back()->with("CORRECTO", "Sucursal actualizado correctamente");
        } else {
            return back()->with("INCORRECTO", "Error al actualizar");
        }
    }


    public function destroy($id)
    {

        try {
            $sql = DB::delete(" delete from sucursal where id_sucursal=$id ");
        } catch (\Throwable $th) {
            $sql = 0;
        }


        if ($sql == 1) {
            return back()->with("CORRECTO", "Sucursal eliminado correctamente");
        } else {
            return back()->with("INCORRECTO", "Error al eliminar");
        }
    }
}
