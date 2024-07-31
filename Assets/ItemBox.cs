using System.Collections;
using System.Collections.Generic;
using System.Transactions;
using UnityEngine;

public class ItemBox : MonoBehaviour
{
    private Renderer myRenderer;
    public Color touchColor;
    private Color originalColor;
    // Start is called before the first frame update
    void Start()
    {

        myRenderer = GetComponent<Renderer>();

    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other) // 유니티가 자동으로 발생시켜주는 함수
    {   // Trigger인 콜라이더와 충돌시 호출
        
        if(other.tag == "EndPoint")
        {
            Debug.Log("충돌했음! endPoint");
            myRenderer.material.color = Color.red;

        }
    }

    // 일반 콜라이더와 충돌했을때 자동으로 실행
    private void OnCollisionEnter(Collision collision)
    {
        Debug.Log("충돌");
    }
}
