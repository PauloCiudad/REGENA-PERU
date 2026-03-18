CREATE TABLE AREA_NEGOCIO (
    IDAREA_NEGOCIO VARCHAR2(5) PRIMARY KEY NOT NULL,
    DESCRIPCION VARCHAR2(70)
);

CREATE TABLE ESTADOS_COTIZACION (
    IDESTADO VARCHAR2(4) PRIMARY KEY NOT NULL,
    DESCRIPCION VARCHAR2(75)
);

CREATE TABLE cotizacion_cabecera (
    id_cotizacion             NUMBER(5) PRIMARY KEY NOT NULL,
    ano                       NUMBER(4) NOT NULL,
    fecha_cotizacion          DATE NOT NULL,
    PROVEEDOR             NUMBER NOT NULL,
    VENDEDOR              NUMBER NOT NULL,
    atencion                VARCHAR2(150),
    referencia                VARCHAR2(500),
    nro_oferta_tecnica        VARCHAR2(100),
    forma_pago                VARCHAR2(200),
    lugar_entrega             VARCHAR2(200),
    validez_oferta              NUMBER(5),
    garantia                  VARCHAR2(300),
    observaciones             VARCHAR2(2000),
    estado_cotizacion        varchar2(5) NOT NULL,
    igv                       NUMBER(15,2) DEFAULT 0 NOT NULL,
    fecha_creacion        DATE DEFAULT SYSDATE NOT NULL,
    usuario_creacion      VARCHAR2(100) DEFAULT USER NOT NULL,
    fecha_modificacion    DATE,
    usuario_modificacion  VARCHAR2(100),
    IDAREA_NEGOCIO VARCHAR2(5),


    CONSTRAINT FK_COT_CAB_PROV FOREIGN KEY (PROVEEDOR)
        REFERENCES CORRENTISTAS(IDCORRENTISTA),
    CONSTRAINT FK_COT_CAB_VEND FOREIGN KEY (VENDEDOR)
        REFERENCES CORRENTISTAS(IDCORRENTISTA)
);

//crea tu tabla de items

ALTER TABLE COTIZACION_CABECERA ADD TIPO_COTIZACION NUMBER(1) NOT NULL;

CREATE TABLE cotizacion_detalle (
    item_cotizacion     NUMBER(10) PRIMARY KEY,
    id_cotizacion             NUMBER NOT NULL,
    id_item                   NUMBER NOT NULL,
    cantidad                  NUMBER(15,3) NOT NULL,
    precio_unitario           NUMBER(15,2) NOT NULL,
    precio_total              NUMBER(15,2) NOT NULL,

    MARGEN                    NUMBER(6) NOT NULL,
    COMISION                  NUMBER(6) NOT NULL,
    IMPORTE_COMISION          NUMBER(15,2) NOT NULL,

    CONSTRAINT FK_COTCAB_COTDET FOREIGN KEY (ITEM_COTIZACION)
        REFERENCES cotizacion_cabecera(id_cotizacion)
        ON DELETE CASCADE,
    CONSTRAINT ck_cot_det_cantidad CHECK (cantidad > 0),
    CONSTRAINT ck_cot_det_precio CHECK (precio_unitario >= 0),
    CONSTRAINT ck_cot_det_MARG CHECK (MARGEN BETWEEN 0 AND 100),
    CONSTRAINT ck_cot_det_COM CHECK (COMISION BETWEEN 0 AND 100)
);

//CREAR TABLA DE COSTOS
