#include <bits/stdc++.h>
using namespace std;

int main() {
    cout<<"Enter the number of letter: ";
    int n; cin>>n;
    vector<string> v(n);
    cout<<"Enter received data: ";
    for(int i=0; i<n; i++) cin>>v[i];

    bool hasError=false;
    for(string s: v){
        int m=s.size();
        int cnt=0;
        for(int i=0; i<m-1; i++){
            if(s[i]=='1') cnt++;
        }
        if(cnt%2==0){
            if(s[m-1]=='1') hasError=true;
        }
        else{
            if(s[m-1]=='0') hasError=true;
        }
    }
    if(hasError) cout<<"Error detected\n";
    else cout<<"No error detected\n";
}