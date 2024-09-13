
import { NativeModules } from 'react-native';

const { RNHinaReactNativeAbtest } = NativeModules;

/**
 * 初始化
 *
 * @param config 初始化配置，类型 String
 */
function init(url){
    RNHinaReactNativeAbtest &&
      RNHinaReactNativeAbtest.init &&
      RNHinaReactNativeAbtest.init(url);
  }


async function fetchCacheABTest(params){
      if(RNHinaReactNativeAbtest && RNHinaReactNativeAbtest.fetchCacheABTest){
            try{
              return await RNHinaReactNativeAbtest.fetchCacheABTest(params);
            }catch(e){
                 console.log(e);
            }
      }
}

async function asyncFetchABTest(params){
    if(RNHinaReactNativeAbtest && RNHinaReactNativeAbtest.asyncFetchABTest){
            try{
              return await RNHinaReactNativeAbtest.asyncFetchABTest(params);
            }catch(e){
                 console.log(e);
            }
      }
}

async function fastFetchABTest(params){
    if(RNHinaReactNativeAbtest && RNHinaReactNativeAbtest.fastFetchABTest){
                try{
                  return await RNHinaReactNativeAbtest.fastFetchABTest(params);
                }catch(e){
                     console.log(e);
                }
          }
}

export default RNHinaReactNativeAbtest;
