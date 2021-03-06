unit AccountNew;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, DbCtrls,DataModuleMain, db;

type

  { Tfrm_AccountNew }

  Tfrm_AccountNew = class(TForm)
    btnSave: TButton;
    btnCancel: TButton;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    DBNavigator_Acct: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    StatusBar1: TStatusBar;
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frm_AccountNew: Tfrm_AccountNew;

implementation

{$R *.lfm}

{ Tfrm_AccountNew }

procedure Tfrm_AccountNew.FormCreate(Sender: TObject);
begin
    With DM_Main do
    begin
      dataAccount.insert ;
    end;
end;

procedure Tfrm_AccountNew.btnSaveClick(Sender: TObject);
begin
   DM_Main.dataAccount.post;
   modalResult := mrOK;
end;

procedure Tfrm_AccountNew.FormCloseQuery(Sender: TObject; var CanClose: boolean
  );
begin
     if NOT (DM_Main.dataAccount.state in [dsBrowse]) then
     begin
       canclose := false;
       showMessage('Save or Cancel changes...');

     end;
end;

procedure Tfrm_AccountNew.btnCancelClick(Sender: TObject);
begin
      DM_Main.dataAccount.cancel;
      ModalResult:= mrCancel;
end;

procedure Tfrm_AccountNew.btnCloseClick(Sender: TObject);
begin

end;

end.

