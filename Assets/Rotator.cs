using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotator : MonoBehaviour
{

    //public Transform myTransform;
    // Start is called before the first frame update
    void Start()
    {    
    
    }

    // Update 는 약 1초에 60번
    void Update()
    {
        transform.Rotate(60*Time.deltaTime, 60*Time.deltaTime, 60*Time.deltaTime); // 너무 빠름 -> 업데이트 한번에 60도 회전
        // Time.deltaTime -> ex 초당 60프레임 => 1/60
    }
    
    // 1m * 30 = 30 * (1/30) = 1m

    // 1m를 깜빡이는 횟수로 쪼갤 것 -> Time.deltaTime

}
