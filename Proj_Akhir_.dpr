program Proj_Akhir_;

uses
  Forms,
  MAIN in 'MAIN.pas' {_Main},
  produk_ in 'produk_.pas' {manage_},
  dm in 'dm.pas' {_dm_: TDataModule},
  depan_ in 'depan_.pas' {_Login},
  login in 'login.pas' {_daftar},
  cek_out in 'cek_out.pas' {_keranjang},
  struk in 'struk.pas' {_Struk},
  adm_pesanan in 'adm_pesanan.pas' {Pesanan_};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(T_Login, _Login);
  Application.CreateForm(Tmanage_, manage_);
  Application.CreateForm(TPesanan_, Pesanan_);
  Application.CreateForm(T_Main, _Main);
  Application.CreateForm(T_dm_, _dm_);
  Application.CreateForm(T_daftar, _daftar);
  Application.CreateForm(T_keranjang, _keranjang);
  Application.CreateForm(T_Struk, _Struk);
  Application.Run;
end.
