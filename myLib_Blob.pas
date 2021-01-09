unit myLib_Blob;

interface
uses DB, Graphics, Classes, SysUtils, ExtDlgs, Windows
;

function Blob_FromFile(pBlobField : TField;pFileName:string): Integer;
function Blob_ToFile(pBlobField : TField;pFileName:string): Integer;
function Blob_FromFileImage(pBlobField : TField):Boolean;
function Blob_ToFileImage(pBlobField : TField):Boolean;
function Blob_Clear(pBlobField : TField;msg:string):Boolean;

implementation
function Blob_FromFile(pBlobField : TField;pFileName:string): Integer;
var blob : TStream;
xDataset : TDataSet;
fs : TStream;

begin
  xDataset := pBlobField.DataSet;
  blob := xDataSet.CreateBlobStream(pBlobField, bmWrite);
  try
    blob.Seek(0, soFromBeginning);
    fs := TFileStream.Create(pFileName, fmOpenRead or fmShareDenyWrite);

    try
     blob.CopyFrom(fs, fs.Size);
     Result := fs.Size;
     except
       Result := -2;
     end;
  except
    Result := -1;
  end;
  blob.Free;
end;

function Blob_ToFile(pBlobField : TField;pFileName:string): Integer;
var
  blob : TStream;
  xDataset : TDataSet;

begin
  xDataset := pBlobField.DataSet;
  blob:= xDataSet.CreateBlobStream(pBlobField, bmRead);
  try
    blob.Seek(0, soFromBeginning);
    with TFileStream.Create(pFileName, fmCreate) do
    try
      Result := -1;
      CopyFrom(blob, blob.Size);
      Result := blob.Size;
    finally
      Free
    end;
  finally
    blob.Free
    end;
end;

function Blob_FromFileImage(pBlobField:TField):Boolean;
var
  PostingOK :Boolean;
  OpenPicDlg : TOpenPictureDialog;
begin
  Result := True;
  OpenPicDlg := TOpenPictureDialog.Create(nil);

  if OpenPicDlg.Execute then begin
    try
      PostingOK := False;
      if pBlobField.DataSet.State = dsBrowse then begin
        pBlobField.DataSet.Edit;
        PostingOK := True;
      end;

      if Blob_FromFile(pBlobField, OpenPicDlg.FileName)< 0 then begin
        Result := False;
        If PostingOK then
        pBlobField.DataSet.Cancel;
        end
        else
        if PostingOK then
        pBlobField.DataSet.Post;
      except
        Result := False;
      end;
  end;
    OpenPicDlg.Free;
end;

function Blob_ToFileImage(pBlobField:TField):Boolean;
var
  SavePicDlg : TSavePictureDialog;
begin
  Result:= True;
  SavePicDlg :=  TSavePictureDialog.Create(nil);

  if SavePicDlg.Execute then begin
    try
      Result := Blob_ToFile(pBlobField, SavePicDlg.FileName) > 0
    except
      Result := False;
  end;
  end;
  SavePicDlg.Free;
end;

function Blob_Clear(pBlobField:TField;msg:string):Boolean;
var
  PostingOK : Boolean;
begin
  Result := True;
  if MessageBox(0, PChar(msg), 'Perhatian', MB_OKCANCEL + MB_ICONWARNING + MB_DEFBUTTON2) = IDOK then
  begin
    try
      PostingOK := False;
      if pBlobField.DataSet.State = dsBrowse then begin
        pBlobField.DataSet.Edit;
        PostingOK := True;
      end;
      pBlobField.Clear;

      if PostingOK then
      pBlobField.DataSet.Post;
      except
        Result:= False;
    end;
  end;
end;
end.
