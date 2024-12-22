unit API.Interfaces;

interface
uses
  API.Types;

type
  iBaseFiredacParams<T: TBaseFiredacDriver> = interface ['{B5A4A031-EFA0-4424-902D-2529FC4F1B48}']

    function Pooled(aValue: Boolean): iBaseFiredacParams<T>; overload;
    function Database(aValue: string): iBaseFiredacParams<T>; overload;
    function Username(aValue: string): iBaseFiredacParams<T>; overload;
    function Password(aValue: string): iBaseFiredacParams<T>; overload;

    function Pooled: Boolean; overload;
    function Database: string; overload;
    function UserName: string; overload;
    function Password: string; overload;

    function Params: iBaseFiredacParams<T>;
  end;

  iMSAccesseParams   = iBaseFiredacParams<TMSAccessDriver>;

  iSQLiteParams<T: TSQLiteDriver>  = interface (iBaseFiredacParams<T>)
    function LockingMode(aValue: TSQLiteLockingMode): iSQLiteParams<T>; overload;
    function Encrypt(aValue: TSQLiteEncryptMode): iSQLiteParams<T>; overload;

    function LockingMode: TSQLiteLockingMode; overload;
    function Encrypt: TSQLiteEncryptMode; overload;
  end;

  iPostgreSqlParams = iBaseFiredacParams<TPostgreSqlDriver>;
  iMySQLParams      = iBaseFiredacParams<TMySQLDriver>;
  iFirebirdParams   = iBaseFiredacParams<TFirebirdDriver>;
  iInterbaseParams  = iBaseFiredacParams<TInterbaseDriver>;
  iInterbaseLParams = iBaseFiredacParams<TInterbaseLiteDriver>;


implementation


end.
