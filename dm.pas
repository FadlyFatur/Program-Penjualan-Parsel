unit dm;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZConnection, frxClass, frxDBSet;

type
  T_dm_ = class(TDataModule)
    ZCon_parselisme: TZConnection;
    _produk_zq: TZQuery;
    _cust_ds: TDataSource;
    order_detail_zq: TZQuery;
    _produk_zqprod_id: TStringField;
    _produk_zqprod_nama: TStringField;
    _produk_zqprod_jenis: TStringField;
    _produk_zqprod_harga: TIntegerField;
    _produk_zqQtyinStock: TIntegerField;
    _produk_zqGambar: TBlobField;
    Cust_zq: TZQuery;
    detail_ds: TDataSource;
    order_ds: TDataSource;
    order_detail_zqrc_total: TIntegerField;
    _produk_ds: TDataSource;
    history_zq: TZQuery;
    history_ds: TDataSource;
    order_detail_zqre_harga: TIntegerField;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    order_detail_zqrc_produk: TStringField;
    order_detail_zqproduk_id: TStringField;
    order_detail_zqid_order: TIntegerField;
    order_detail_zqquantity: TIntegerField;
    Order_zq: TZQuery;
    history_zqproduk_id: TStringField;
    history_zqid_order: TIntegerField;
    history_zqquantity: TIntegerField;
    history_zqProduk: TStringField;
    procedure order_detail_zqCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _dm_: T_dm_;

implementation

{$R *.dfm}

procedure T_dm_.order_detail_zqCalcFields(DataSet: TDataSet);
begin
order_detail_zqrc_total.Value:= order_detail_zqquantity.Value * order_detail_zqre_harga.Value;
end;

end.
