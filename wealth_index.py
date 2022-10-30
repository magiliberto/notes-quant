import pandas as pd
import scipy as sp

class return_serie(pd.DataFrame):
    """
    # 1 calculate wealth index
    # 2 calculate previous max
    # 3 calculate drawdowns
    """
    def __init__(self, serie: pd.DataFrame):
        super().__init__(serie)
        
    def wealth_index(self):
        return 1000 * (self + 1).cumprod()
    def wealth_index_cummax(self):
        return self.wealth_index().cummax()
    def drawdowns(self):
        return (self.wealth_index() - self.wealth_index().cummax()) / self.wealth_index().cummax()
    def df(self):
        return pd.concat(
            {
                "wealth_index":        self.wealth_index(),
                "wealth_index_cummax": self.wealth_index_cummax(),
                "drawdowns":           self.drawdowns()
            },
            axis = 1
        )
    def skewness(self):
        return ((self - self.mean())**3).mean()/self.std(ddof=0)**3
    def kurtosis(self):
        return ((self - self.mean())**4).mean()/self.std(ddof=0)**4
    def is_normal(self, level=0.01):
        return pd.Series({i: sp.stats.jarque_bera(self[i]).pvalue > level for i in self.columns})
        
    
    def semi_deviation(self, below="average"):
        if below == "average":
            below_lim = self.mean()
        elif below == "zero":
            below_lim = 0
        
        return (self[self>below_lim]).std()

def get_hfi_returns():
    returns = pd.read_csv(
        "class-notes/notebooks_and_codem01_v02/nb/data/edhec-hedgefundindices.csv",
        na_values= -99.99,
        header = 0,
        index_col = 0,
        parse_dates = True,
        infer_datetime_format=True
    )
    
    returns = returns/100
    returns.index = returns.index.to_period("M")
    return returns