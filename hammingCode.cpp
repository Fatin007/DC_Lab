#include<bits/stdc++.h>
using namespace std;

vector<int>HammingCode(vector<int> v){
    int m=v.size();
    int r=0;
    while((1<<r)<m+r+1) r++;

    vector<int>hammingCode(m+r+1);
    int j=0;
    for(int i=1;i<=m+r;i++){
        if((i&(i-1))==0) continue;
        hammingCode[i]=v[j];
        j++;
    }

    for(int i=0;i<r;i++){
        int x=(1<<i);
        // cout<<x<<endl;
        int value=0;
        for(int j=x+1;j<m+r+1;j++){
            if(j&(1<<i)){
                value^=hammingCode[j];
                // cout<<j<<" ";
            }
        }
        // cout<<value<<endl<<endl;
        hammingCode[x]=value;
    }
    reverse(hammingCode.begin(),hammingCode.end());
    return hammingCode;
}

int binaryToDecimal(vector<int> v){
    int n=v.size();
    int result=0;
    for(int i=0;i<n;i++){
        result=result*2+v[i];
    }
    return result;
}

int checkErrorPosition(vector<int> w){
    int m=w.size();
    int r=0;
    while((1<<r)<m) r++;

    vector<int>parity(r);
    for(int i=0;i<r;i++){
        int x=(1<<i);
        // cout<<x<<endl;
        int value=0;
        for(int j=x+1;j<m;j++){
            if(j&(1<<i)){
                value^=w[j];
                // cout<<j<<" ";
            }
        }
        // cout<<value<<endl<<endl;
        parity[i]=value;
    }
    for(int i=0;i<r;i++) cout<<parity[i];
    // reverse(parity.begin(),parity.end());
    int errorPosition=binaryToDecimal(parity);
    return errorPosition;
}

int main(){
    cout<<"Enter the number of bits: ";
    int n; cin>>n;
    vector<int>v(n);
    cout<<"Enter the data bits: ";
    string s; cin>>s;
    reverse(s.begin(),s.end());
    for(int i=0;i<n;i++) v[i]=s[i]-'0';

    vector<int>hammingCode=HammingCode(v);
    cout<<"Hamming Code: ";
    for(int i=1;i<hammingCode.size();i++) cout<<hammingCode[i];
    cout<<endl;

    cout<<"Enter the received Hamming Code size: ";
    int m; cin>>m;
    vector<int>w(m+1);
    cout<<"Enter the received Hamming Code: ";
    string t; cin>>t;
    reverse(t.begin(),t.end());
    for(int i=1;i<m+1;i++) w[i]=t[i-1]-'0';

    if(checkErrorPosition(w)==0) cout<<"No error detected"<<endl;
    else cout<<"Error detected at position "<<checkErrorPosition(w)<<endl;
}
