a`stockprice[ exchange_String:"NSE", ticker_String ] := ImportString[ StringReplace[ Import["https://www.google.com/finance/info?q=" <> exchange <> ":" <> ticker, "Text"], "\n// " -> ""], "RawJSON"]
