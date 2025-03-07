@extends('layouts.app')

@section('content')
    <!--.side-menu-->

    <h2 class="text-center text-secondary pb-2 font-weight-bold">BIENVENIDO: {{ strtoupper(Auth::user()->nombres) }}</h2>

    <div class="container-fluid text-center">
        <div class="row">

            <!--.col-->
            <div class="col-12">
                <div class="row">
                    <!--.col-->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <article class="statistic-box purple">
                            <div>
                                <div class="number text-light">{{ $envioHoy }}</div>
                                <div class="caption">
                                    <div>ENVIOS REALIZADOS</div>
                                </div>
                            </div>
                        </article>
                    </div>

                    <div class="col-12 col-sm-6 col-lg-3">
                        <article class="statistic-box purple">
                            <div>
                                <div class="number text-light">{{ $envioHoyRecepcionado }}</div>
                                <div class="caption">
                                    <div>ENVIOS RECEPCIONADOS</div>
                                </div>
                            </div>
                        </article>
                    </div>

                    <div class="col-12 col-sm-6 col-lg-3">
                        <article class="statistic-box purple">
                            <div>
                                <div class="number text-light">{{ $envioHoyNoRecepcionado }}</div>
                                <div class="caption">
                                    <div>ENVIOS NO RECEPCIONADOS</div>
                                </div>
                            </div>
                        </article>
                    </div>
                    <!--.col-->

                    <!--.col-->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <article class="statistic-box purple">
                            <div>
                                <div class="number text-light">{{ $usuarios }}</div>
                                <div class="caption">
                                    <div>USUARIOS</div>
                                </div>
                            </div>
                        </article>
                    </div>

                    <div class="col-12">
                        <article class="statistic-box bg-info">
                            <div>
                                <div class="number text-light">{{ $envios }}</div>
                                <div class="caption">
                                    <div>TOTAL DE ENVIOS</div>
                                </div>
                            </div>
                        </article>
                    </div>
                    <!--.col-->
                </div>
                <!--.row-->
            </div>
            <!--.col-->

            <!--.col-->
            <div class="container" style="width: 100%;">
                <canvas id="grafica" height="90"></canvas>
            </div>
            <!--.row-->

        </div>
    </div>

    <!--.container-fluid-->
    <!--.page-content-->
    </body>
@endsection
