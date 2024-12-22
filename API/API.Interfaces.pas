unit API.Interfaces;

interface
uses
  API.Types;

type
  iBaseFDParams<T: TBaseFiredacDriver> = interface ['{B5A4A031-EFA0-4424-902D-2529FC4F1B48}']

    function Pooled(aValue: Boolean): iBaseFDParams<T>; overload;
    function Database(aValue: string): iBaseFDParams<T>; overload;
    function Username(aValue: string): iBaseFDParams<T>; overload;
    function Password(aValue: string): iBaseFDParams<T>; overload;

    function Pooled: Boolean; overload;
    function Database: string; overload;
    function UserName: string; overload;
    function Password: string; overload;

    function Params: iBaseFDParams<T>;
  end;
  iBaseFiredacParams = iBaseFDParams<TBaseFiredacDriver>;
  iMSAccesseParams   = iBaseFDParams<TMSAccessDriver>;

  iSQLiteParams<T: TSQLiteDriver>  = interface (iBaseFDParams<T>)
    function LockingMode(aValue: TSQLiteLockingMode): iBaseFDParams<T>; overload;
    function Encrypt(aValue: TSQLiteEncryptMode): iBaseFDParams<T>; overload;

    function LockingMode: TSQLiteLockingMode; overload;
    function Encrypt: TSQLiteEncryptMode; overload;
  end;

  iPostgreSqlParams = iBaseFDParams<TPostgreSqlDriver>;
  iMySQLParams      = iBaseFDParams<TMySQLDriver>;
  iFirebirdParams   = iBaseFDParams<TFirebirdDriver>;
  iInterbaseParams  = iBaseFDParams<TInterbaseDriver>;
  iInterbaseLParams = iBaseFDParams<TInterbaseLiteDriver>;


implementation


end.
