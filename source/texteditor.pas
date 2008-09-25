unit texteditor;

interface

uses
  Windows, Classes, Graphics, Forms, Controls, helpers, StdCtrls, TntStdCtrls, Registry, VirtualTrees,
  ComCtrls, ToolWin, Dialogs, SysUtils;

{$I const.inc}

type
  TfrmTextEditor = class(TMemoEditor)
    memoText: TTntMemo;
    tlbStandard: TToolBar;
    btnWrap: TToolButton;
    btnLoadText: TToolButton;
    btnApply: TToolButton;
    btnCancel: TToolButton;
    lblTextLength: TLabel;
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnLoadTextClick(Sender: TObject);
    procedure btnWrapClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure memoTextChange(Sender: TObject);
    procedure memoTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FModified: Boolean;
    procedure SetModified(NewVal: Boolean);
    property Modified: Boolean read FModified write SetModified;
  public
    function GetText: WideString; override;
    procedure SetText(text: WideString); override;
    procedure SetMaxLength(len: integer); override;
    procedure SetFont(font: TFont); override;
  end;


implementation

uses main;

{$R *.dfm}


function TfrmTextEditor.GetText: WideString;
begin
  Result := memoText.Text;
end;

procedure TfrmTextEditor.SetText(text: WideString);
begin
  // TODO: Find out why the Delphi IDE insists hinting that this
  //       property is ANSI when it is in fact a WideString.
  memoText.Text := text;
end;

procedure TfrmTextEditor.SetMaxLength(len: integer);
begin
  // Input: Length in number of bytes.
  memoText.MaxLength := len;
end;

procedure TfrmTextEditor.SetFont(font: TFont);
begin
  memoText.Font := font;
end;

procedure TfrmTextEditor.FormCreate(Sender: TObject);
begin
  InheritFont(Font);
end;


procedure TfrmTextEditor.FormDestroy(Sender: TObject);
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  if reg.OpenKey(REGPATH, False) then begin
    reg.WriteInteger( REGNAME_EDITOR_WIDTH, Width );
    reg.WriteInteger( REGNAME_EDITOR_HEIGHT, Height );
    reg.CloseKey;
  end;
  reg.Free;
end;


procedure TfrmTextEditor.FormShow(Sender: TObject);
begin
  // Restore form dimensions
  Width := Mainform.GetRegValue(REGNAME_EDITOR_WIDTH, DEFAULT_EDITOR_WIDTH);
  Height := Mainform.GetRegValue(REGNAME_EDITOR_HEIGHT, DEFAULT_EDITOR_HEIGHT);
  // Fix label position:
  lblTextLength.Top := tlbStandard.Top + (tlbStandard.Height-lblTextLength.Height) div 2;
  SetWindowSizeGrip(Handle, True);
  memoText.SelectAll;
  memoText.SetFocus;
  memoTextChange(Sender);
  Modified := False;
end;


procedure TfrmTextEditor.memoTextKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  case Key of
    // Cancel by Escape
    VK_ESCAPE: btnCancelClick(Sender);
    // Apply changes and end editing by Ctrl + Enter
    VK_RETURN: if ssCtrl in Shift then btnApplyClick(Sender);
  end;
end;

procedure TfrmTextEditor.btnWrapClick(Sender: TObject);
var
  WasModified: Boolean;
begin
  Screen.Cursor := crHourglass;
  // Changing the scrollbars invoke the OnChange event. We avoid thinking the text was really modified.
  WasModified := Modified;
  if memoText.ScrollBars = ssBoth then
    memoText.ScrollBars := ssVertical
  else
    memoText.ScrollBars := ssBoth;
  TToolbutton(Sender).Down := memoText.ScrollBars = ssVertical;
  Modified := WasModified;
  Screen.Cursor := crDefault;
end;


procedure TfrmTextEditor.btnLoadTextClick(Sender: TObject);
var
  d: TOpenDialog;
begin
  d := TOpenDialog.Create(Self);
  d.Filter := 'Textfiles (*.txt)|*.txt|All files (*.*)|*.*';
  d.FilterIndex := 0;
  if d.Execute then try
    Screen.Cursor := crHourglass;
    memoText.Text := ReadTextFile(d.FileName);
    if (memoText.MaxLength > 0) and (Length(memoText.Text) > memoText.MaxLength) then
      memoText.Text := copy(memoText.Text, 0, memoText.MaxLength);
  finally
    Screen.Cursor := crDefault;
  end;
  d.Free;
end;


procedure TfrmTextEditor.btnCancelClick(Sender: TObject);
var
  DoPost: Boolean;
begin
  if Modified then
    DoPost := MessageDlg('Apply modifications?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  else
    DoPost := False;
  if DoPost then
    TCustomVirtualStringTree(Owner).EndEditNode
  else
    TCustomVirtualStringTree(Owner).CancelEditNode;
end;


procedure TfrmTextEditor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  btnCancelClick(Sender);
  CanClose := False; // Done by editor link
end;


procedure TfrmTextEditor.btnApplyClick(Sender: TObject);
begin
  TCustomVirtualStringTree(Owner).EndEditNode;
end;


procedure TfrmTextEditor.memoTextChange(Sender: TObject);
begin
  lblTextLength.Caption := FormatNumber(Length(memoText.Text)) + ' characters.';
  if memoText.MaxLength > 0 then
    lblTextLength.Caption := lblTextLength.Caption + ' (Max: '+FormatNumber(memoText.MaxLength)+')';
  Modified := True;
end;


procedure TfrmTextEditor.SetModified(NewVal: Boolean);
begin
  if FModified <> NewVal then begin
    FModified := NewVal;
    btnApply.Enabled := FModified;
  end;
end;


end.