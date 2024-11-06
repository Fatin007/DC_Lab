#include <bits/stdc++.h>
using namespace std;

string Complement(string s){
    for(int i=0; i<s.size(); i++){
        if(s[i]=='0') s[i]='1';
        else s[i]='0';
    }
    return s;
}

string binaryAdd(string a, string b){
    int n = a.size();
    string result = "";
    int carry = 0;
    for(int i=n-1; i>=0; i--){
        int sum = (a[i]-'0') + (b[i]-'0') + carry;
        result = to_string(sum%2) + result;
        carry = sum/2;
    }
    if(carry){
        result = binaryAdd(result,"1"); 
    }
    return result;
}

int main(){
    cout<<"Enter number of segments: ";
    int n; cin>>n;
    vector<string> segments(n);
    cout<<"Enter segments: ";
    for(int i=0; i<n; i++){
        cin>>segments[i];
    }
    string sum="00000000";
    for(int i=0; i<n; i++){
        sum = binaryAdd(sum, segments[i]);
    }
    cout<<"Sum: "<<sum<<endl;
    string checksum = Complement(sum);
    cout<<"Checksum: "<<checksum<<endl;

    cout<<"Enter receiver segments: ";
    vector<string> receiverSegments(n+1);
    for(int i=0; i<n+1; i++){
        cin>>receiverSegments[i];
    }
    string receiverSum="00000000";
    for(int i=0; i<n+1; i++){
        receiverSum = binaryAdd(receiverSum, receiverSegments[i]);
    }
    string receiverChecksum = Complement(receiverSum);
    bool hasError = false;
    for(auto c: receiverChecksum){
        if(c=='1'){
            hasError = true;
            break;
        }
    }
    if(hasError) cout<<"Error detected"<<endl;
    else cout<<"No error detected"<<endl;
}