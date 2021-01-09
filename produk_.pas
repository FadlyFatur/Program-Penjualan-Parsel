unit produk_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, SMDBGrid, StdCtrls, Mask, DBCtrls,
  XPMan, SMDBCtrl, ExtDlgs, DB, EDBImage, jpeg;

type
  Tmanage_ = class(TForm)
    SMDB_produk: TSMDBGrid;
    Button4: TButton;
    ignore__: TXPManifest;
    OpenDialog1: TOpenDialog;
    SMDBNavigator1: TSMDBNavigator;
    EDBImage1: TEDBImage;
    order_: TImage;
    Image1: TImage;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure order_Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  manage_: Tmanage_;
  var idCustomer: string;

implementation

uses
  dm, myLib_Blob,adm_pesanan,depan_;
{$R *.dfm}

procedure Tmanage_.Button1Click(Sender: TObject);
begin
  _dm_._produk_zq.Post;
end;

procedure Tmanage_.Button3Click(Sender: TObject);
begin
  _dm_._produk_zq.Delete;
end;

procedure Tmanage_.Button4Click(Sender: TObject);
var
  PostingOK : Boolean;
  OpenPicDlg : TOpenPictureDialog;
begin
  OpenPicDlg := TOpenPictureDialog.Create(nil);
  if OpenPicDlg.Execute then begin
    Try
      PostingOK := False;
      if _dm_._produk_zq.State = dsBrowse then
      begin
        _dm_._produk_zq.Edit;
        PostingOK := True;
      end;
      EDBImage1.Picture.LoadFromFile(OpenPicDlg.FileName);
      if PostingOK then
        _dm_._produk_zq.Post;
    Except
      Application.MessageBox('Upload File Image Gagal!!!', 'Error!!!', MB_OK +
        MB_ICONSTOP);
    end;

  end;
  OpenPicDlg.Free;
end;




procedure Tmanage_.order_Click(Sender: TObject);
begin
  adm_pesanan.Pesanan_.ShowModal;
end;

procedure Tmanage_.Image2Click(Sender: TObject);
begin
  depan_._Login.Show;
  Close;
  idCustomer:='';
  
end;

end.
