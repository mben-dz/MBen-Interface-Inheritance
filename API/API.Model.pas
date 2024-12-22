unit API.Model;

interface
uses
  API.Types,
  API.Interfaces;

type
  TBaseConnectionParams<T: TBaseFiredacDriver> = class(TInterfacedObject, iBaseFDParams<T>)
  protected
    fPooled: Boolean;
    fDatabase,
    fUsername,
    fPassword: string;

    function Pooled(aValue: Boolean): iBaseFDParams<T>; overload; virtual;
    function Database(aValue: string): iBaseFDParams<T>; overload; virtual;
    function Username(aValue: string): iBaseFDParams<T>; overload; virtual;
    function Password(aValue: string): iBaseFDParams<T>; overload; virtual;

    function Pooled: Boolean; overload; virtual;
    function Database: string; overload; virtual;
    function UserName: string; overload; virtual;
    function Password: string; overload; virtual;

    function Params: iBaseFDParams<T>; virtual;

     procedure ValidateParams; virtual; abstract;
  end;

  TSqliteParams<T: TSQLiteDriver> = class(TBaseConnectionParams<T>, iSQLiteParams<T>)
  strict private
    fLockingMode: TSQLiteLockingMode;
    fEncrypt: TSQLiteEncryptMode;
  public
  {$REGION 'I am looking for a workaround or a clean solution to avoid redundant code re-implementation. '}
//    function Pooled(aValue: Boolean): iBaseFDParams<T>; overload; //override;
//    function Database(aValue: string): iBaseFDParams<T>; overload; //override;
//    function Username(aValue: string): iBaseFDParams<T>; overload; //override;
//    function Password(aValue: string): iBaseFDParams<T>; overload; //override;
//
//    function Pooled: Boolean; overload; override;
//    function Database: string; overload; override;
//    function UserName: string; overload; override;
//    function Password: string; overload; override;

//    function Params: iBaseFDParams<T>; //override;
  {$ENDREGION}

    constructor Create
      (const aDatabase: string;
       const aUsername: string = ''; const aPassword: string = '';
       const aLockingMode: TSQLiteLockingMode = mLockingExclusive; aEncrypt: TSQLiteEncryptMode = EncryptNone);

    procedure ValidateParams; override;

    function LockingMode(aValue: TSQLiteLockingMode): iBaseFDParams<T>; overload;
    function Encrypt(aValue: TSQLiteEncryptMode): iBaseFDParams<T>; overload;

    function LockingMode: TSQLiteLockingMode; overload;
    function Encrypt: TSQLiteEncryptMode; overload;

    class function New(const aDatabase: string;
       const aUsername: string = ''; const aPassword: string = '';
       const aLockingMode: TSQLiteLockingMode = mLockingExclusive; aEncrypt: TSQLiteEncryptMode = EncryptNone): iSQLiteParams<T>;

  end;

implementation

{ TBaseConnectionParams }

{$REGION '  Base Firedac Params .. '}
function TBaseConnectionParams<T>.Pooled(aValue: Boolean): iBaseFDParams<T>;
begin
  Result := Self as iBaseFDParams<T>;

  fPooled := aValue;
end;

function TBaseConnectionParams<T>.Pooled: Boolean;
begin
  Result := fPooled;
end;

function TBaseConnectionParams<T>.Database(aValue: string): iBaseFDParams<T>;
begin
  result := Self as iBaseFDParams<T>;

  fDatabase := aValue;
end;

function TBaseConnectionParams<T>.Database: string;
begin
  Result := fDatabase;
end;

function TBaseConnectionParams<T>.Username(aValue: string): iBaseFDParams<T>;
begin
  result := Self as iBaseFDParams<T>;

  fUsername := aValue;
end;

function TBaseConnectionParams<T>.Username: string;
begin
  Result := fUsername;
end;

function TBaseConnectionParams<T>.Password(aValue: string): iBaseFDParams<T>;
begin
  Result := Self;

  fPassword := aValue;
end;

function TBaseConnectionParams<T>.Password: string;
begin
  Result := fPassword;
end;

function TBaseConnectionParams<T>.Params: iBaseFDParams<T>;
begin
  Result := Self as iBaseFDParams<T>;
end;
{$ENDREGION}

{ TSqliteParams }

constructor TSqliteParams<T>.Create(const aDatabase, aUsername, aPassword: string;
  const aLockingMode: TSQLiteLockingMode; aEncrypt: TSQLiteEncryptMode);
begin
  inherited Create;
  fDatabase := aDatabase;
  fUsername := aUsername;
  fPassword := aPassword;
  fLockingMode := aLockingMode;
  fEncrypt := aEncrypt;
end;

class function TSqliteParams<T>.New(const aDatabase, aUsername, aPassword: string;
  const aLockingMode: TSQLiteLockingMode;
  aEncrypt: TSQLiteEncryptMode): iSQLiteParams<T>;
begin
  Result := TSqliteParams<T>.Create(aDatabase, aUsername, aPassword, aLockingMode, aEncrypt);
end;

{$REGION '  is there a Solution to avoid redundant code re-implementation .. '}
//function TSqliteParams<T>.Pooled(aValue: Boolean): iBaseFDParams<T>;
//begin
//  inherited Pooled(aValue);
//  Result := Self as iBaseFDParams<T>;
//end;
//
//function TSqliteParams<T>.Pooled: Boolean;
//begin Result := inherited Pooled;
//end;
//
//function TSqliteParams<T>.Database(aValue: string): iBaseFDParams<T>;
//begin
//  inherited Database(aValue);
//  Result := Self as iBaseFDParams<T>;
//end;
//
//function TSqliteParams<T>.Database: string;
//begin Result := inherited Database;
//end;
//
//function TSqliteParams<T>.Username(aValue: string): iBaseFDParams<T>;
//begin
//  inherited Username(aValue);
//  Result := Self as iBaseFDParams<T>;
//end;
//
//function TSqliteParams<T>.Username: string;
//begin Result := inherited Username;
//end;
//
//function TSqliteParams<T>.Password(aValue: string): iBaseFDParams<T>;
//begin
//  inherited Password(aValue);
//  Result := Self as iBaseFDParams<T>;
//end;
//
//function TSqliteParams<T>.Password: string;
//begin Result := inherited Password;
//end;
//
//function TSqliteParams<T>.Params: iBaseFDParams<T>;
//begin //inherited;
//end;
{$ENDREGION}

function TSqliteParams<T>.LockingMode(
  aValue: TSQLiteLockingMode): iBaseFDParams<T>;
begin
  Result := Self;

  fLockingMode := aValue;
end;

function TSqliteParams<T>.LockingMode: TSQLiteLockingMode;
begin
  Result := fLockingMode;
end;

function TSqliteParams<T>.
Encrypt(aValue: TSQLiteEncryptMode): iBaseFDParams<T>;
begin
  Result := Self;

  fEncrypt := aValue;
end;

function TSqliteParams<T>.Encrypt: TSQLiteEncryptMode;
begin
  Result := fEncrypt;
end;

procedure TSqliteParams<T>.ValidateParams;
begin
  if fDatabase = '' then
    raise EInvalidParameterError.Create('Database must be specified.');
end;

end.
