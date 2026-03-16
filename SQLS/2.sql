CREATE TABLE cotizacion_cabecera (
    id_cotizacion             NUMBER(5) PRIMARY KEY NOT NULL,
    fecha_cotizacion          DATE NOT NULL,
    IDCORRENTISTA             NUMBER NOT NULL,
    atencion_a                VARCHAR2(150),
    referencia                VARCHAR2(500),
    nro_oferta_tecnica        VARCHAR2(100),
    forma_pago                VARCHAR2(200),
    lugar_entrega             VARCHAR2(200),
    validez_dias              NUMBER(5) DEFAULT 15,
    garantia                  VARCHAR2(300),  --QUIZA TENGAMOS TABLA PARA ESTO
    observaciones             VARCHAR2(2000),
    id_estado_cotizacion      NUMBER NOT NULL,
    subtotal                  NUMBER(15,2) DEFAULT 0 NOT NULL,
    igv                       NUMBER(15,2) DEFAULT 0 NOT NULL,
    total                     NUMBER(15,2) DEFAULT 0 NOT NULL,
    fecha_creacion        DATE DEFAULT SYSDATE NOT NULL,
    usuario_creacion      VARCHAR2(100) DEFAULT USER NOT NULL,
    fecha_modificacion    DATE,
    usuario_modificacion  VARCHAR2(100), 
    ESTADO NUMBER(1) DEFAULT 0 NOT NULL,
);


CREATE TABLE AREA_NEGOCIO (

)

CREATE TABLE cotizacion_cabecera (
    id_cotizacion             NUMBER(5) PRIMARY KEY NOT NULL,
    ano                       NUMBER(4) NOT NULL,
    fecha_cotizacion          DATE NOT NULL,
    PROVEEDOR             NUMBER NOT NULL,
    VENDEDOR              NUMBER NOT NULL,
    atencion_a                VARCHAR2(150),
    referencia                VARCHAR2(500),
    nro_oferta_tecnica        VARCHAR2(100),
    forma_pago                VARCHAR2(200),
    lugar_entrega             VARCHAR2(200),
    validez_dias              NUMBER(5) DEFAULT 15,
    garantia                  VARCHAR2(300),
    observaciones             VARCHAR2(2000),
    id_estado_cotizacion      NUMBER NOT NULL,
    subtotal                  NUMBER(15,2) DEFAULT 0 NOT NULL,
    igv                       NUMBER(15,2) DEFAULT 0 NOT NULL,
    total                     NUMBER(15,2) DEFAULT 0 NOT NULL,
    fecha_creacion        DATE DEFAULT SYSDATE NOT NULL,
    usuario_creacion      VARCHAR2(100) DEFAULT USER NOT NULL,
    fecha_modificacion    DATE,
    usuario_modificacion  VARCHAR2(100), 
    ESTADO_ COTIZACION NUMBER(1) DEFAULT 0 NOT NULL,
    ENTREGA VARCHAR2(15),
    IDAREA_NEGOCIO VARCHAR2(5),


    CONSTRAINT FK_COT_CAB FOREIGN KEY (PROVEEDOR)
        REFERENCES CORRENTISTAS(IDCORRENTISTA),
    CONSTRAINT FK_COT_CAB FOREIGN KEY (VENDEDOR)
        REFERENCES CORRENTISTAS(IDCORRENTISTA)
);